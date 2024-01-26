import appManager from '@ohos.app.ability.appManager';
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';

@Entry
@Component
export struct SecondPage {
  processInfo() {
    appManager.getRunningProcessInformation().then((data) => {
      console.log('processInfo1' + JSON.stringify(data));
    }).catch((error) => {
      console.error('error ' + JSON.stringify(error));
    });
    // appManager.getRunningProcessInformation((error, data) => {
    //   console.log('error: '+ error.code + 'processInfo2 ' + JSON.stringify(data));
    // });
  }

  showToast() {
    try {
      promptAction.showToast({
        message: 'will back root view',
        duration: 2000,
        bottom: '50%'
      });
    } catch (err) {
      console.error('show toast err', JSON.stringify(err));
    }
  }

  showDialog() {
    // promptAction.showDialog({
    //   title: '返回',
    //   message: 'click btn',
    //   buttons:[
    //     {
    //       text:'cancel',
    //       color:'#666666',
    //     },
    //     {
    //       text:'ok',
    //       color:'#000000'
    //     }
    //   ]
    // }).then(data => {
    //   if (data.index == 1) {
    //     router.back({url:'pages/RootPage'});
    //   }
    // }).catch(err => {
    //   console.log('show dailog err '+ JSON.stringify(err));
    // });
    promptAction.showDialog({
      title: '返回',
      message: 'click btn',
      buttons: [
        {
          text: 'cancel',
          color: '#666666',
        },
        {
          text: 'ok',
          color: '#000000'
        }
      ]
    }, (err, data) => {
      if (data.index == 1) {
        this.goBack();
      } else {
        console.log('err: ' + JSON.stringify(err) + 'index: ' + data.index);
      }
    })
  }

  goBack() {
    router.back({ url: 'pages/RootPage' })
  }

  build() {
    Row() {
      Column() {
        Text('SecondPage')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('返回').onClick(() => {

          this.showDialog();
          //router.back({url:'pages/RootPage'})
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}