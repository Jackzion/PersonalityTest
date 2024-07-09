/***
 * 顶部状态栏
 */
import router from '@ohos.router'

@Component
export struct TitleComponent {
  @Prop title: string //父子传递为单向  父--->子

  build() {
    Row({ space: 22 }) {
      Image($r('app.media.back')).width(50).height(50).fillColor(Color.White)
        .margin({ left: 15 })
        .onClick(() => {
          router.back()
        })
      Text(this.title).fontSize(20)
    }.height("10%")
    .width('100%')
    .border({ width: 1 })

  }
}