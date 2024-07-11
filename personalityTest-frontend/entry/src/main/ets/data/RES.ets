/**
 * 后端响应的包装类 --- @Observed 修饰 ，响应类
 */
@Observed
export class Res {

  public res:string;
  public oneName : string ;
  public oneDis : string;

  public erate : string;
  public irate : string;
  public srate : string;
  public nrate : string;
  public trate : string;
  public frate : string;
  public jrate : string;
  public prate : string;


  // res:string,eRate:string,iRate:string,sRate:string,nRate:string,tRate:string,fRate:string,jRate:string,pRate:string,oneName:string,oneDis:string
  // constructor(resss:Res) {
  //   this.res = resss.res;
  //   this.eRate  = resss.eRate;
  //   this.iRate  = resss.iRate;
  //   this.sRate  = resss.sRate;
  //   this.nRate  = resss.nRate;
  //   this.tRate  = resss.tRate;
  //   this.fRate  = resss.fRate;
  //   this.jRate  = resss.jRate;
  //   this.pRate  = resss.pRate;
  //   this.oneName = resss.oneName ;
  //   this.oneDis =  resss.oneDis;
  // }

  constructor(res:string,oneName:string,oneDis:string,erate:string,irate:string,srate:string,nrate:string,trate:string,frate:string,jrate:string,prate:string,
  ) {
      this.res = res;
      this.oneName = oneName ;
      this.oneDis =  oneDis;

      this.erate  = erate;
      this.irate  = irate;
      this.srate  = srate;
      this.nrate  = nrate;
      this.trate  = trate;
      this.frate  = frate;
      this.jrate  = jrate;
      this.prate  = prate;

  }



}