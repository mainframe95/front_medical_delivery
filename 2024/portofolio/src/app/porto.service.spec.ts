import { TestBed } from '@angular/core/testing';

import { PortoService } from './porto.service';

describe('PortoService', () => {
  let service: PortoService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(PortoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
