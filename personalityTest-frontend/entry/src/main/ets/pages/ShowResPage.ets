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
  @State oneName : string = '';
  @State resShow: Res = new Res('', '', '', '0', '0', '0', '0', '0' ,'0', '0','0') ;

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
          const res : Res  = JSON.parse(response).data
          this.oneName = res.oneName;
          this.resStr = res.res;

          this.resShow = res;
          // this.resShow = new Res(res);
          console.log("this.resShow.resStr:" + this.resStr)
          console.log("this.resShow.res:" + this.resShow.res)
          console.log("this.resShow.irate:" + this.resShow.irate)
          // this.resStr = this.resShow.res
          // console.log("resStr:" + this.resStr)

        }
      })
  }
  scroller : Scroller = new Scroller()
  build() {
    // todo : justifyContent
    Scroll(this.scroller){
      Column() {
        // 标题
        Text("测试结果").fontSize(30).fontWeight(FontWeight.Bold)
        // 结果图片
        ImageComponent({resStr:this.resStr,oneName:this.oneName});
        // 属性面板
        PropertiesPanelComponent({resReturn:this.resShow})
      }
      .width("94%")
      .margin({ left: 10, right: 10,top:10 ,bottom:10})
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .scrollable(ScrollDirection.Vertical) // 纵向滑动
    .scrollBar(BarState.On) // 保持显示滑动条
    .scrollBarColor(Color.White)
    .scrollBarWidth(5)
    .edgeEffect(EdgeEffect.Spring)
  }
}