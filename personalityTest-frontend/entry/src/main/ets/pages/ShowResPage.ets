import http from '@ohos.net.http';
import router from '@ohos.router';
import { ImageComponent } from '../component/ImageComponent'
import { PropertiesPanelComponent } from '../component/PropertiesPanelComponent';
import { Res } from '../data/RES';
@Entry
@Component
struct ShowResPage {

  @State result : string = router.getParams()['ans'];
  @State resStr : string = '';
  @State resShow : Res = new Res() ;

  // 页面渲染前hook ， post请求
  aboutToAppear() {
    //获取网络请求
    let httpRequest = http.createHttp();
    httpRequest.request("localhost:8881/manage/submit",
      {
        method: http.RequestMethod.POST,
        extraData: {
          "ans": this.result,
        }
      },
      (err, data) => {
        if (!err) {
          const response = data.result.toString();
          console.log("response：" + response);
          const res  = JSON.parse(response).data

          this.resStr = res.oneName;
          this.resShow = res;
          console.log("this.resShow.res:" + this.resStr)
          console.log("this.resShow.res:" + this.resShow.res)
          // this.resStr = this.resShow.res
          // console.log("resStr:" + this.resStr)

        }
      })
  }

  build() {
    // todo : justifyContent
    Column() {
      Text("测试结果").fontSize(30).fontWeight(FontWeight.Bold)
      ImageComponent({resStr:this.resStr});
      PropertiesPanelComponent({resReturn:this.resShow})
    }
  }
}