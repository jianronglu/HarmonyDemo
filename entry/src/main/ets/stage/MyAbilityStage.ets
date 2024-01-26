import AbilityStage from '@ohos.app.ability.AbilityStage';
import Want from '@ohos.app.ability.Want';
import appRecovery from '@ohos.app.ability.appRecovery';

export class MyAbilityStage extends AbilityStage {
  onCreate() {
    //当应用创建时调用。
    console.log('MyAbilityStage.onCreate is called');
    appRecovery.enableAppRecovery(
      appRecovery.RestartFlag.ALWAYS_RESTART,
      appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR,
      appRecovery.SaveModeFlag.SAVE_WITH_FILE
    );

  }

  onAcceptWant(want: Want) {
    //启动一个specified ability时触发的事件。
    console.log('MyAbilityStage.onAcceptWant is called');
    return 'com.upchina.oem.sgzq';
  }

  onConfigurationUpdate(config) {
    //环境变化通知接口，发生全局配置变更时回调。
    console.log('MyAbilityStage.onConfigurationUpdate, language:' + config.language);
  }

  onMemoryLevel(level) {
    //当系统已决定调整内存时调用。例如，当该功能在后台运行时，没有足够的内存来运行尽可能多的后台进程时可以使用
    console.log('onMemoryLevel, level:' + JSON.stringify(level));
  }
}