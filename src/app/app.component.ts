import { Component, OnInit } from '@angular/core';
import { ConfigService } from './config/config.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  data;

  constructor(private env: ConfigService) { }

  ngOnInit() {
    this.data = this.env.config
  }
}
