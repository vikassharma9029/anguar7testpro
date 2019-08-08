import { Component, OnInit } from '@angular/core';
import { ListingService } from '../listing.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {
  data : any;
  
  constructor(public userList: ListingService , public router:Router) {   
     this.getUserList();
  }

  /**
   * Fetch user list
   */
  getUserList(){
    //let userList = new ListService();
    this.userList.getList().subscribe(details => {     
      this.data = details;
         });  
  }

  /**
   * Delete user from list
   * @param userId 
   * @param obj 
   */
  deleteUser(userId,obj){
    let res;
    if (confirm("Are you to delete this record !!")) {
    this.userList.deleteUser(userId).subscribe(details => {     
      res = details;
      if(res == 1){
        alert("record has been deleted successfully !!");
        this.getUserList();
      } else {
        alert("there is some problem in deleting !!");
        return false;
      }
    });
  } 
  }

  editUser(userId : number,obj){ 
    this.router.navigate(['/userEdit',userId]);
    return false;
  }


  ngOnInit() {
  }

}
