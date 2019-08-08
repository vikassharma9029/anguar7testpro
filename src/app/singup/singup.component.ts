import { Component, OnInit } from '@angular/core';
import { ListingService } from '../listing.service';
import { FormGroup, FormControl, Validators, FormArray } from '@angular/forms';
import {Router} from "@angular/router"
import {ActivatedRoute} from "@angular/router"


@Component({
  selector: 'app-singup',
  templateUrl: './singup.component.html',
  styleUrls: ['./singup.component.css']
})
export class SingupComponent implements OnInit {
  data: any;
  userRegisterForm: FormGroup;
  type : string;
  buttonAction : string;
  roles:any;
  constructor(public userApi: ListingService, 
              private router: Router,
              private acRoute : ActivatedRoute) {
                
  
  }
  
  /**
   * @desc Singup from submitted values get
   * @param values 
   */
  signup(values) { 
    if(this.userRegisterForm.valid){
      if(values.user_id == '0'){
        this.saveUser(values);
      } else {
        this.updateUser(values);
      }
    
  } else {
    alert("Please fill every field !!");
    return false;
  }
  }

   /**
   * @desc Insert records into database.
   * @param values 
   */
  saveUser(values){
    let res :any;
    this.userApi.insertUser(values).subscribe(details => {
      res = details;
      if (res == 1) {
        alert("Record has successfully insered !!");
        this.userRegisterForm.reset();
        this.router.navigate(['/']);
        return false;
      } else {
        alert("Record not insered !!");
        return false;
      }
    });
  }

  /**
   * @desc Update user details.
   * @param values 
   */
  updateUser(values){
    let res;
    this.userApi.updateUser(values).subscribe(details => {
      res = details;
      if (res == 1) {
        alert("Record has successfully updated !!");
        this.userRegisterForm.reset();
        this.router.navigate(['/']);
        return false;
      } else {
        alert("Record not updated !!");
        return false;
      }
    });
  }

  ngOnInit() {
    this.type = 'Register Form';
    this.buttonAction = 'Submit';

    this.roles = ['Admin','Super Admin','Developer','Tester'];
    /**
     * Registration form elements..
     */
    this.userRegisterForm = new FormGroup({
      user_id: new FormControl('0', Validators.required),
      first_name: new FormControl('', Validators.required),
      last_name: new FormControl('', Validators.required),
      email: new FormControl('', Validators.required),
      dept: new FormControl('', Validators.required),
      role: new FormControl(''),

    });

    /**
     * #Get acRoute = activeRoute to fetch route params.
     */
    this.acRoute.paramMap.subscribe(params => {
      const userId = params.get('id');
      if(userId){
        this.getEditUserList(userId);
      }
    });

  }

  /**
   * @desc fetch and put values in form for edit.
   * @param userId 
   */
  getEditUserList(userId){
    this.type = 'Edit Form';
    this.buttonAction = 'Update';
    this.userApi.editUser(userId).subscribe(result => 
      this.userRegisterForm.patchValue({
      user_id : result[0].id,
      first_name: result[0].name,
      last_name: result[0].last_name,
      email: result[0].email,
      dept: result[0].dept,
      role: result[0].role,
    })
  );  
  }
}
