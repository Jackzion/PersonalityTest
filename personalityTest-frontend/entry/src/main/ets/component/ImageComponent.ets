@Component
  // @Entry
export struct ImageComponent {
  @State clicked: boolean = false;
  @Prop oneName: string
  @Prop resStr: string

  // @State resStr: string = 'ENTP'

  build() {
    Row() {
      Column() {
        // todo : 每个类型选一张图
        Image($rawfile((this.resStr + ".png")))
          .width("60%")
          .height("60%")
          .objectFit(ImageFit.Contain)
            // .border({ width: 1 })
          .rotate({
            x: 0,
            y: 1,
            z: 0,
            angle: this.clicked ? 360 : 0
          })
          .scale(
            this.clicked
              ? { x: 1.25, y: 1.25 }
              : { x: 1, y: 1 }
          )
          .opacity(this.clicked ? 0.6 : 1)
          .onClick(() => {
            this.clicked = !this.clicked;
          })
          .animation(
            {
              delay: 10,
              duration: 1000,
              iterations: 1,
              curve: Curve.Smooth,
              playMode: PlayMode.Normal
            }
          )
        Text(this.oneName)
          .fontSize(25)
          .width("90%")
          .height("20%")
          .decoration({
            type: TextDecorationType.Underline,
            color: Color.Orange
          })
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)

      }.justifyContent(FlexAlign.SpaceEvenly)

    }
    .height("30%")
    .cardStyle()
    .margin({ top: 15 })
    // .border({ width: 1 })
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}

//自定义卡片样式
@Styles function cardStyle() {
  .width("95%")
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}