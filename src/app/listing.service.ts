import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class ListingService {
  APIURL = "http://10.1.17.112/newApp/angularBackend/Observer/newApp.php";
  constructor(public http : HttpClient) {
   
    
   }
  getList(){
    let params = {
      'flagCheck' : "listing"
    }
    let URL = this.APIURL;
    //return this.http.get(URL);
    return this.http.post(URL,params);
   }    

   insertUser(data){
    let params = {
      'flagCheck' : "save",
      'data'      : data
    }
    let URL = this.APIURL;
    //return this.http.get(URL);
    return this.http.post(URL,params);
   }

   editUser(userId){
    let params = {
      'flagCheck' : "listing",
      'userId'   : userId,
    }
    let URL = this.APIURL;
    return this.http.post(URL,params);
   }

   updateUser(values){
    let params = {
      'flagCheck' : "update",
      'data'   : values,
    }
    let URL = this.APIURL;
    return this.http.post(URL,params);
   }

   deleteUser(userId){
      let params = {
      'flagCheck' : "delete",
      'userId'   : userId,
    }

    let URL = this.APIURL;
    return this.http.post(URL,params);

   }
}
