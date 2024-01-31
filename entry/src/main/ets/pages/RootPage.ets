import router from '@ohos.router'
import {default as PageConstUtil} from '../../define/CommonConstUtil'

@Entry
@Component
export struct RootPage {
  @State message: string = '控件学习'

  jump() {
    let options = {
      url: PageConstUtil.second,
      params: {
        text: '第二页',
        data: {
          array: [1, 2, 3],
        }
      }
    }
    router.pushUrl(options)
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
        Button(){
          Text('router 传值')
            .fontColor('red')
            .fontSize(30)
        }.onClick(() => {
          let options = {
            url: 'pages/ThirdPage',
            params: {
              text: '点击有惊喜哦',
              data: {
                array: [1, 2, 3],
              }
            }
          }
          router.pushUrl(options)
        })
        .margin({top: 30})
      }
      .width('100%')
    }
    .height('100%')
  }
}