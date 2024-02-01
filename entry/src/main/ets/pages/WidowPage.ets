import window from '@ohos.window';
import common from '@ohos.app.ability.common';

@Entry
@Component
export struct AlertWindow {
  private context: common.ApplicationContext | null = null;
  private windowClass = null;

  build() {
    // try {
    //   window.createWindow(config, (err, data) => {
    //     if (err.code) {
    //       console.error('Failed to create the window. Cause: ' + JSON.stringify(err));
    //       return;
    //     }
    //     windowClass = data;
    //     console.info('Succeeded in creating the window. Data: ' + JSON.stringify(data));
    //     windowClass.resize(500, 1000);
    //   });
    // } catch (exception) {
    //   console.error('Failed to create the window. Cause: ' + JSON.stringify(exception));
    // }

  }
}