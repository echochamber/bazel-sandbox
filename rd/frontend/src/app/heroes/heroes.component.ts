import { Component, OnInit } from '@angular/core';
import { Hero } from '../hero';
import { Greeting, GreeterService } from './greeter.service';

@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  providers: [ GreeterService ],
  styleUrls: ['./heroes.component.sass']
})
export class HeroesComponent implements OnInit {
  error: any;
  headers: string[] | undefined;
  greeting: Greeting | undefined;

  hero: Hero = {
    id: 1,
    name: 'Windstorm'
  };

  constructor(private greeterService: GreeterService) {}
  ngOnInit() {
    this.showGreetingResponse();
  }
  clear() {
    this.greeting = undefined;
    this.error = undefined;
    this.headers = undefined;
  }



  showGreeting() {
    this.greeterService.getGreeting()
      .subscribe(
        (data: Greeting) => this.greeting = {...data},
        (error: any) => this.error = error // error path
      );
  }
  showGreetingResponse() {
    this.greeterService.getGreetingResponse()
      // resp is of type `HttpResponse<Greeting>`
      .subscribe(resp => {
        // display its headers
        const keys = resp.headers.keys();
        this.headers = keys.map(key =>
          `${key}: ${resp.headers.get(key)}`);

        // access the body directly, which is typed as `Greeting`.
        this.greeting = { ... resp.body };
      });
  }
}