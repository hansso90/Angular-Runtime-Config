import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { load } from '@angular/core/src/render3';

@Injectable({
  providedIn: 'root'
})
export class ConfigService {

  env: Object = {}

  constructor(private http: HttpClient) {
    this.loadAppConfig();
   }

  loadAppConfig() {
    return new Promise((resolve, reject) => {
     this.http.get('/assets/config.json')
     .subscribe(data => {
      this.env = data;
      resolve(true);
     })
  })
  }

  get config() {
    return this.env;
  } 
}
