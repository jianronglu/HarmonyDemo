import measure from '@ohos.measure';
import router from '@ohos.router';
import {
  ConstPagesUtil,
  ScreenUtil
}  from '../../define/CommonConstUtil';

@Entry
@Component
export struct MeasurePage {
  @State message: string = '文本计算'
  @State textWidth: number = this.calculateWidth(this.message)

  calculateWidth(text): number {
    return measure.measureText({
      textContent: text,
      fontSize: '50px'
    })
  }

  build() {
    Row() {//控制元素水平居中
      Column({ space: 20 }) {
        Text('The width of message: ' + this.textWidth)
          .fontColor('#000000')
        Text(this.message)
          .fontWeight(30)
          .fontColor('#666666')
          .onClick(() => {
            let ret = router.getParams()['context']
            this.message = ret
            this.textWidth = this.calculateWidth(ret)
          })
        Text('back')
          .fontWeight(30)
          .fontColor('#666666')
          .onClick(() => {
            router.back({ url: ConstPagesUtil.root })
          })
      }
      .width(ScreenUtil.FULL_SCREEN_WIDTH)
      .height(ScreenUtil.FULL_SCREEN_HEIGHT)
      .justifyContent(FlexAlign.Center) // colum 垂直方向
      .alignItems(HorizontalAlign.Center) //colum 水平方向
    }
    .alignItems(VerticalAlign.Center)//row
    .justifyContent(FlexAlign.Center)
  }
}