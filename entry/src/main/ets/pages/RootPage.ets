import router from '@ohos.router'

@Entry
@Component
export struct RootPage {
  @State message: string = '控件学习'

  jump() {
    router.pushUrl({ url: 'pages/SecondPage' })
      .then(() => {
        console.log('success')
      })
      .catch(err => {
        console.log(JSON.stringify(err))
      })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('下一页').onClick(() => {
          console.log('点击了按钮');
          this.jump()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}