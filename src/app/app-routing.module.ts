import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ListComponent } from './list/list.component';
import { SingupComponent } from './singup/singup.component';

const routes: Routes = [
  { path : '', component : ListComponent},  
  { path : 'singup', component : SingupComponent },
  { path : 'userEdit/:id', component : SingupComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
