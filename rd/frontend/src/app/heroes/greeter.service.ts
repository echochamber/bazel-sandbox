import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import { HttpErrorResponse, HttpResponse } from '@angular/common/http';


export interface Greeting {
  name?: string | undefined
}



@Injectable({
  providedIn: 'root'
})
export class GreeterService {
  greetingUrl = 'http://localhost:8081/v1/hello';
  constructor(private http: HttpClient) {}

  getGreeting() {
    return this.http.post<Greeting>(this.greetingUrl, {"name": "somename"});
  }
  getGreetingResponse(): Observable<HttpResponse<Greeting>> {
    return this.http.post<Greeting>(
      this.greetingUrl, {"name": "somename"}, { observe: 'response' });
  }

}
