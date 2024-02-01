import router from '@ohos.router'

import { ConstPagesUtil, ScreenUtil } from '../../define/CommonConstUtil';

class Item {
  public readonly router: string = ''
  public readonly title: string = ''
  public params: Object | null = null

  constructor(router, title, {params}) {
    this.router = router
    this.title = title
    this.params = params
  }
}

@Entry
@Component
export struct RootPage {
  private message: string = '控件学习'
  private list: Array<Item> = [
    new Item(ConstPagesUtil.second, 'second',{params: [1,2,4]}),
    new Item(ConstPagesUtil.third, 'third',{params: [1,2,4]}),
    new Item(ConstPagesUtil.measure, 'measure',{params: [1,2,4]}),
    new Item(ConstPagesUtil.appear, 'appear',{params: [1,2,4]}),
  ];

  build() {
    Row() {
      Column() {
        Text(this.message).fontWeight(80).margin({ top: 30 }).fontStyle(FontStyle.Italic).fontSize(30)
        ForEach(this.list, (item: Item) => {
          Text(item.title)
            .fontColor('red')
            .fontWeight(40)
            .margin({ top: 15 })
            .onClick(() => {
              router.pushUrl({ url: item.router})
            })
        })
      }
      .width(ScreenUtil.FULL_SCREEN_WIDTH)
      .height(ScreenUtil.FULL_SCREEN_HEIGHT)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
  }
}