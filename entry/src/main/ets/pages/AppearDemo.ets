import promptAction from '@ohos.promptAction';

@Entry
@Component
export struct AppearDemo {
  @State isShow: boolean = true
  @State changeAppear: string = '卸载挂在组件'
  private text: string = 'onAppear'

  build() {
    Column() {
      Button(this.changeAppear)
        .onClick(() => {
          this.isShow = !this.isShow
        })
        .margin(15)
      if (this.isShow) {
        Text(this.text).fontSize(25).fontWeight(FontWeight.Bold)
          .onDisAppear(() => {
            promptAction.showToast({
              message: 'is hidden',
              duration: 2000
            })
          })
          .onAppear(() => {
            promptAction.showToast({
              message: 'is shown',
              duration: 2000
            })
          })
      }
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}