import {Inject, Injectable} from '@angular/core';
import {Order} from "../models/order";
import {HttpClient, HttpHeaders, HttpParams} from "@angular/common/http";
import {OrderedDish} from "../models/orderedDish";
import {TableStorageService} from "./table-storage.service";

@Injectable()
export class OrderService {

  constructor(@Inject('API_URL') private apiUrl: string,
              private tableStorageService: TableStorageService,private http:HttpClient) { }

  public getOrderDetails():Promise<Order>{
    return this.http.get<Order>(this.apiUrl + 'order/table/'+this.tableStorageService.table).toPromise();
  }

  createOrder(orderDishes: OrderedDish[]):Promise<Order>{
    let item = localStorage.getItem('token');
    let tokenHeader = '';
    let authHeader = '';
    if (item != null){
      tokenHeader = 'Bearer ' + item;
      authHeader = 'Authorization';
    }

    let params = new HttpParams().set("table", this.tableStorageService.table);

    return this.http.post<Order>(this.apiUrl + "order", orderDishes,
      {headers: new HttpHeaders({
              authHeader:  tokenHeader,
             }), params: params}).toPromise();
  }

  submitOne(orderedDish: OrderedDish): Promise<Order>{
    let item = localStorage.getItem('token');
    let tokenHeader = '';
    let authHeader = '';
    if (item != null){
      tokenHeader = 'Bearer ' + item;
      authHeader = 'Authorization';
    }

    let params = new HttpParams().set("table", this.tableStorageService.table);

    return this.http.post<Order>(this.apiUrl + "order/submitOne", orderedDish,
      {headers: new HttpHeaders({
          authHeader:  tokenHeader,
        }), params: params}).toPromise();
  }
}
