//Topic.ets
import { TitleComponent } from '../component/TitleComponent'
import { ProgressComponent } from '../component/ProgressComponent'
import router from '@ohos.router'
import http from '@ohos.net.http'
import { TopicBodyComponent } from '../component/TopicBodyComponent'

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

      //答题界面 , 响应 link banding 子 ---> 父
      TopicBodyComponent({finishTopic: $finishTopic,allTopic: $allTopic})
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#f0f0f0")
  }


}
