import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ListComponent } from './list/list.component';
import { SingupComponent } from './singup/singup.component';
import { ListingService } from './listing.service';
import { HttpClientModule } from '@angular/common/http';// for call API

import { FormsModule,ReactiveFormsModule }   from '@angular/forms';
import { HeaderComponent } from './layout/header/header.component';
import { FooterComponent } from './layout/footer/footer/footer.component'; // For forms


@NgModule({
  declarations: [
    AppComponent,
    ListComponent,
    SingupComponent,
    HeaderComponent,
    FooterComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [ListingService],
  bootstrap: [AppComponent]
})
export class AppModule { }
