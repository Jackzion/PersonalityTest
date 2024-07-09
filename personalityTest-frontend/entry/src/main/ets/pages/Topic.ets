//Topic.ets
import { TitleComponent } from '../component/TitleComponent'
import { ProgressComponent } from '../component/ProgressComponent'
import { TopicBodyComponent } from '../component/TopicBodyComponent'
import router from '@ohos.router'
import http from '@ohos.net.http'

@Entry
@Component
struct Topic {
  @State paramsFromIndex: object = router.getParams()
  @State finishTopic: number = 0
  @State allTopic: number = 0

  build() {
    Column({ space: 20 }) {
      //标题
      TitleComponent({ title: this.paramsFromIndex?.['args2'] + "测试 " })

      //进度条
      ProgressComponent({ finishTopic: this.finishTopic, allTopic: this.allTopic })

      //答题界面 , 响应banding 子 ---> 父
      TopicBodyComponent({finishTopic:$finishTopic,allTopic:$allTopic})
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#f0f0f0")
  }

  //渲染之前进行网络请求
  aboutToAppear(): void {
    //初始化数据
    let list = []

    //获取网络请求
    let httpRequest = http.createHttp();
    httpRequest.request("localhost:8899/homp/getAll", (err, data) => {
      if (!err) {
        //数据解析
        const response = data.result.toString();
        const res = JSON.parse(response).data

        for (let i = 0; i < res.length; i++) {
          let item = res[i];
          list.push({
            id: item.sequenceNumber,
            name: item.name,
            optionA: item.optionA,
            valA: item.valA,
            optionB: item.optionB,
            valB: item.valB,
          });
          // console.log(list[i].id)
        }
        this.allTopic = res.length //进行总题目数的修改
      } else {
        console.info('error:' + JSON.stringify(err));
      }
    });

    this.data = new MyDataSource(list)
  }

}
