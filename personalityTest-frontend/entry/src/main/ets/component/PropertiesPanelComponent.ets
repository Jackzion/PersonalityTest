
import { Res } from '../data/RES'
//属性面板
@Component
  // @Entry
export struct PropertiesPanelComponent {
  @ObjectLink resReturn: Res

  build() {
    Column() {
      Column() {
        Row() {
          Text('erate').fontSize(12)
          Slider({
            value: Number(this.resReturn.erate),
            min: 0,
            max: 40,
            style: SliderStyle.InSet
          }).panelStyle()

          Text(this.resReturn.erate + " %").fontSize(12)
        }.width('80%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          Text('irate').fontSize(12)
          Slider({
            value: Number(this.resReturn.irate),
            min: 0,
            max: 40,
            style: SliderStyle.InSet
          }).panelStyle()

          Text(this.resReturn.irate + " %").fontSize(12)
        }.width('80%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          Text('srate').fontSize(12)
          Slider({
            value: Number(this.resReturn.srate),
            min: 0,
            max: 40,
            style: SliderStyle.InSet
          }).panelStyle()

          Text(this.resReturn.srate + " %").fontSize(12)
        }.width('80%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          Text('nrate').fontSize(12)
          Slider({
            value: Number(this.resReturn.nrate),
            min: 0,
            max: 40,
            style: SliderStyle.InSet
          }).panelStyle()

          Text(this.resReturn.nrate + " %").fontSize(12)
        }.width('80%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          Text('trate').fontSize(12)
          Slider({
            value: Number(this.resReturn.trate),
            min: 0,
            max: 40,
            style: SliderStyle.InSet
          }).panelStyle()

          Text(this.resReturn.trate + " %").fontSize(12)
        }.width('80%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          Text('frate').fontSize(12)
          Slider({
            value: Number(this.resReturn.frate),
            min: 0,
            max: 40,
            style: SliderStyle.InSet
          }).panelStyle()

          Text(this.resReturn.frate + " %").fontSize(12)
        }.width('80%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          Text('jrate').fontSize(12)
          Slider({
            value: Number(this.resReturn.jrate),
            min: 0,
            max: 40,
            style: SliderStyle.InSet
          }).panelStyle()

          Text(this.resReturn.jrate + " %").fontSize(12)
        }.width('80%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          Text('prate').fontSize(12)
          Slider({
            value: Number(this.resReturn.prate),
            min: 0,
            max: 40,
            style: SliderStyle.InSet
          }).panelStyle()

          Text(this.resReturn.prate + " %").fontSize(12)
        }.width('80%')
        .justifyContent(FlexAlign.SpaceAround)
      }.cardStyle()
      .margin({ top: 15 })


      Column() {
        Text('disc').fontSize(12).margin({ bottom: 15 })
        Text(this.resReturn.oneDis)
          .fontSize(14)
          .maxLines(15)
          .lineHeight(20)
      }.cardStyle()
      .margin({ top: 15 })
      .justifyContent(FlexAlign.SpaceAround)
    }.width("100%")
    .height("80%")
    .alignItems(HorizontalAlign.Center)
  }
}

@Extend(Slider) function panelStyle() {	//自定义滑动条样式
  .width("50%")
  .blockColor('#ffefeff5')
  .trackColor('#ADD8E6')
  .selectedColor('#ff168a86')
  .showTips(true)
  .enabled(false)
}

//自定义卡片样式
@Styles function cardStyle() {
  .width("95%")
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}