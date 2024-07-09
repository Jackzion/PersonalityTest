import router from '@ohos.router';
@Entry
@Component
struct Index {
  @State imageWidth : number = 128;
  @State imageHeight : number = 128;
  // 四个按钮初始化状态 ，默认选中一个
  @State ischeckedA : boolean = true;
  @State ischeckedB : boolean = false;
  @State ischeckedC : boolean = true;
  @State ischeckedD : boolean = false;
  // 性别 初始化 -1 -- 无状态 ， 0 -- 女 ， 1 -- 男
  @State sex : number = -1;
  // 测试名称
  @State type : string = '';

  build() {
    // todo : justifyContent
    Column(){
      Text("欢迎进入性格测试").fontWeight(FontWeight.Bolder).fontSize(30)
      this.sexModule();
      this.methodModule();
      this.testButton();
    }.justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder sexModule(){
    //性别选择模块
      Row() {
        Column() {
          Text($r('app.string.sexTitle'))//请选择您的性别 提示
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
      }
      .border({ width: 1 })
      .height('5%')

      Row() {
        Column() {
          Image($r('app.media.man'))
            .width(this.imageWidth)
            .height(this.imageHeight)
            .border({ width: 1 })
            .onClick(() => {
              this.ischeckedA = !this.ischeckedA;
              this.ischeckedB = !this.ischeckedB;
            })

          Radio({ value: 'sex_boy', group: 'sex' }).checked(this.ischeckedA)
            .height(10)
            .width(10)
            .onChange((isChecked: boolean) => {

              if (isChecked) {
                console.log('boy')
                this.sex = 1;
              }
            })
        }
        .width('50%')

        Column() {
          Image($r('app.media.woman'))
            .border({ width: 1 })
            .width(this.imageWidth)
            .height((this.imageHeight))
            .onClick(() => {
              this.ischeckedA = !this.ischeckedA;
              this.ischeckedB = !this.ischeckedB;
            })
          Radio({ value: 'sex_girl', group: 'sex' }).checked(this.ischeckedB)
            .height(10)
            .width(10)
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                console.log('girl')
                this.sex = 0;
              }
            })
        }
        .width('50%')
      }
      .height('20%')
    }

  @Builder methodModule(){
    //性别选择模块
    Row() {
      Column() {
        Text($r('app.string.methodTitle'))//请选择您的性别 提示
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .border({ width: 1 })
    .height('5%')

    Row() {
      Column() {
        Image($r('app.media.man'))
          .width(this.imageWidth)
          .height(this.imageHeight)
          .border({ width: 1 })
          .onClick(() => {
            this.ischeckedC = !this.ischeckedC;
            this.ischeckedD = !this.ischeckedD;
          })

        Radio({ value: 'type_disc', group: 'type' }).checked(this.ischeckedC)
          .height(10)
          .width(10)
          .onChange((isChecked: boolean) => {

            if (isChecked) {
              console.log('disc')
              this.type = 'disc';
            }
          })
      }
      .width('50%')

      Column() {
        Image($r('app.media.woman'))
          .border({ width: 1 })
          .width(this.imageWidth)
          .height((this.imageHeight))
          .onClick(() => {
            this.ischeckedC = !this.ischeckedC;
            this.ischeckedD = !this.ischeckedD;
          })
        Radio({ value: 'type_mbti', group: 'type' }).checked(this.ischeckedD)
          .height(10)
          .width(10)
          .onChange((isChecked: boolean) => {
            if (isChecked) {
              console.log('mbti')
              this.type = 'mbti';
            }
          })
      }
      .width('50%')
    }
    .height('20%')
  }

  @Builder testButton(){
    //开始测试按钮
    Row() {
      Column() {
        Button('开始测试').type(ButtonType.Capsule)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {

            if (this.sex === -1 || this.type === '') {
              AlertDialog.show(
                {
                  title: '提示：',
                  message: '请选择性别或者测试方式！',
                  autoCancel: true,
                  alignment: DialogAlignment.Bottom,
                  offset: { dx: 0, dy: -200 },
                  gridCount: 4,
                }
              )
            } else if (this.type === 'disc') {
              console.log(this.sex.toString())
              console.log(this.type.toString())
              // router.pushUrl({ url: 'pages/EmptyPage' })
              this.clickNext('pages/EmptyPage')
            }
            else {
              //携带参数 进行页面跳转
              console.log('' + this.sex)
              console.log('' + this.type)
              this.clickNext('pages/Topic')
            }
          })
      }
      .width('100%')
    }
  }

  //页面跳转自定义函数
  clickNext(url:string) {
    router.pushUrl({
      url: url, //页面路由url
      params: {  //跳转时的携带的参数
        args1: this.sex,
        args2: this.type,
      }
    }, router.RouterMode.Single //单实例模式。
      //如果目标页面的url在页面栈中已经存在同url页面，离栈顶最近的页面会被移动到栈顶，移动后的页面为新建页。
      //如目标页面的url在页面栈中不存在同url页面，按标准模式跳转。
    )
  }
}


