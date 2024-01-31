import router from '@ohos.router';
import {default as PageConstUtil} from '../../define/CommonConstUtil'
@Entry
@Component
export struct ThirdPage {
  private content: string = '数据显示';
  @State text: string = router.getParams()['text']
  @State data: object = router.getParams()['data']
  @State desc: string = ''

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
      Text(this.content)
        .fontWeight(FontWeight.Bold)
        .fontSize(30)
        .margin({top: 40})

      Text(this.text)
        .fontSize(16)
        .fontWeight(FontWeight.Normal)
        .onClick(() => {
          this.desc = (this.data['array']).toString()
        })
        .margin({top:30})
        .decoration({
          type:TextDecorationType.Underline,
          color: '#666666'
        })

      Text('back & 上一页传值' + this.desc)
        .fontSize(20)
        .fontSize('red')
        .margin({ top: 30 })
        .onClick(() => {
          router.back({ url: PageConstUtil.root });
        })
    }
    .margin({left:15})
  }
}