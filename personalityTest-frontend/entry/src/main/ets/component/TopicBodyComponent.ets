// xxx.ets
import http from '@ohos.net.http';
import router from '@ohos.router';
import Queue from '@ohos.util.Queue';
import { ArrayDataSource } from '../data/ArrayDataSource';
import { Question } from '../data/Question';

@Component
export struct TopicBodyComponent {
  private swiperController: SwiperController = new SwiperController()
  @State private res: string[] = []
  /**
   * @ Link 进行强连接 , 子 --> 父
   */
  @Link  finishTopic: number
  @Link  allTopic: number
  // 创建数据源 IDataSource
  @State data : IDataSource = null;

  //渲染之前进行网络请求 ， 初始化 data
  aboutToAppear(): void {
    //初始化数据
    let list = []

    //获取网络请求
    let httpRequest = http.createHttp();
    httpRequest.request("localhost:8881/manage/getAll", (err, data) => {
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

    this.data = new ArrayDataSource<Question>(list);
  }



  build() {
    Column() {
      //答题区
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: Question) => {
          //嵌套组件 显示题目
          Column() {
            //题干
            Text(item.id + ". " + item.name)

            //选项A
            Button() {
              Row() {
                Text(item.optionA)
              }
            }
            .type(ButtonType.Normal)
            // .optionStyle()
            .onClick(() => {
              let index = Number(item.id)
              this.finishTopic = index
              // 选完了
              if (index === this.data.totalCount()) {
                //1-保存值
                this.res.push(item.valA)
                let ans : string = this.res.join('')
                console.log("ans:" + ans)
                //跳转界面（携带拼接好的选项字符串）
                router.replaceUrl({
                  url: 'pages/ShowResPage',
                  params: {
                    ans: ans,
                  }
                })

              } else {
                //1-保存值
                this.res.push(item.valA)
                //2-换到下一题
                this.swiperController.showNext()
              }

            })

            //选项B
            Button() {
              Row() {
                Text(item.optionB)
              }
            }.type(ButtonType.Normal)
            // .optionStyle()
            .onClick(() => {
              let index = Number(item.id)
              this.finishTopic = index
              if (index === this.data.totalCount()) {
                //如果到最后一题了 显示提交按钮
                //1-保存值
                this.res.push(item.valB)
                let ans = this.res.join('')
                console.log("ans:" + ans)
                //跳转界面
                router.replaceUrl({
                  url: 'pages/ShowResPage',
                  params: {
                    ans: ans,
                  }
                })

              } else {
                //1-保存值
                this.res.push(item.valB)
                //2-换到下一题
                this.swiperController.showNext()
              }

            })

          }.width('90%')
          .height(180)
          .justifyContent(FlexAlign.SpaceEvenly)
        }, item => item)

      }
      .cardStyle() //自定义卡片样式
      .cachedCount(2)
      .index(0)
      .interval(4000)
      .indicator(false)
      .loop(false)
      .duration(1000)
      .itemSpace(0)
      .disableSwipe(true)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString() + this.res.join(''))
      })
    }.width('100%')
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