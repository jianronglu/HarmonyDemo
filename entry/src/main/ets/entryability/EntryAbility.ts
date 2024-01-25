import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

import AbilityConstant from '@ohos.app.ability.AbilityConstant';


let abilityLifecycleCallback = {
  onAbilityCreate(ability) {
    //在ability创建时触发回调
    console.log('AbilityLifecycleCallback onAbilityCreate.');
  },
  onWindowStageCreate(ability, windowStage) {
    //在windowStage创建时触发回调
    console.log('AbilityLifecycleCallback onWindowStageCreate.');
  },
  onWindowStageActive(ability, windowStage) {
    //在windowStage获焦时触发回调
    console.log('AbilityLifecycleCallback onWindowStageActive.');
  },
  onWindowStageInactive(ability, windowStage) {
    //在windowStage失焦时触发回调
    console.log('AbilityLifecycleCallback onWindowStageInactive.');
  },
  onWindowStageDestroy(ability, windowStage) {
    //在windowStage销毁时触发回调
    console.log('AbilityLifecycleCallback onWindowStageDestroy.');
  },
  onAbilityDestroy(ability) {
    //在ability销毁时触发回调
    console.log('AbilityLifecycleCallback onAbilityDestroy.');
  },
  onAbilityForeground(ability) {
    //在ability的状态从后台转到前台时触发回调
    console.log('AbilityLifecycleCallback onAbilityForeground.');
  },
  onAbilityBackground(ability) {
    //在ability的状态从前台转到后台时触发回调
    console.log('AbilityLifecycleCallback onAbilityBackground.');
  },
  onAbilityContinue(ability) {
    //在ability迁移时触发回调
    console.log('AbilityLifecycleCallback onAbilityContinue.');
  }
};

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    console.log('Ability onCreate');
    // 1.通过context属性获取applicationContext
    let applicateionContext = this.context.getApplicationContext();
    // 2.通过applicationContext注册监听应用内生命周期
    try {
      globalThis.lifecycleId = applicateionContext.on('abilityLifecycle', abilityLifecycleCallback);
      console.log('onCreate lifecycleId: ' + globalThis.lifecycleId + ' want: ' + want.abilityName);
    } catch (e) {
      console.log('error: ' + e.code + ' ' + e.message);
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    let applicationCont = this.context.getApplicationContext();
    //3通过applicationContext注销监听应用内生命周期
    applicationCont.off('abilityLifecycle', globalThis.lifecycleId, (error) => {
      if (error.code != 0) {
        console.log('unregisterAbilityLifecycleCallback failed, error: ' + JSON.stringify(error));
      } else {
        console.log('unregisterAbilityLifecycleCallback success');
      }
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/RootPage', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  onMemoryLevel(level) {
    if (level === AbilityConstant.MemoryLevel.MEMORY_LEVEL_CRITICAL) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'MEMORY LEVEL CRITICAL');
    }
  }

  onContinue(wantParams) {
    //当ability迁移准备迁移时触发，保存数据。
    wantParams['myData'] = 'my123456';
    return AbilityConstant.OnContinueResult.AGREE;
  }

  // onNewWant(want, launchParams) {
  //   //当传入新的Want，ability再次被拉起时会回调执行该方法。
  //   console.log('onNewWant, want:' + want.abilityName);
  //   console.log('onNewWant, launchParams:' + JSON.stringify(launchParams));
  // }

  onDump(params) {
    //转储客户端信息时调用。
    console.log('dump, params:' + JSON.stringify(params));
    return ['hhh'];
  }

  onSaveState(resaon, want) {
    if (resaon === AbilityConstant.StateType.CONTINUATION) {
      console.log('Save the ability data when the ability continuation.')
    }
    return AbilityConstant.OnSaveResult.ALL_AGREE;
  }
}

