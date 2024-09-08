package _12469
{
   import _1404._1407;
   import _472._12461;
   import _6._9;
   import _639._12462;
   import _648._12463;
   import _708._715;
   import _783._12475;
   import _93._94;
   import flash.desktop.NativeApplication;
   
   public class _12468 extends _94
   {
      public var _12726:_12470;
      
      private var _12569:_12461;
      
      private var _12594:_12463;
      
      private var _12724:_12462;
      
      private var _appVersion:String;
      
      public function _12468()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._12726 = new _12470();
         this._12569 = _1407.getInstance(_12461);
         this._12594 = _1407.getInstance(_12463);
         this._12724 = _12462.getInstance();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(_12475.LOGIN,this._3762);
      }
      
      private function _3762(param1:_9) : void
      {
         this._12727();
      }
      
      public function _12727() : void
      {
         if(!_2227)
         {
            return;
         }
         if(!this._12594._3766)
         {
            return;
         }
         this._12725();
         this._12569._12679(this._12726.toString());
      }
      
      public function _12725() : void
      {
         this._12726.account.uid = this._12594.uid;
         this._12726.account.email = this._12594.mail;
         this._12726.account.level = this._12594.level;
         this._12726.layout._11139(_715.ARMATURE.toString(),_2220._12697(_715.ARMATURE));
         this._12726.layout._11139(_715.ANIMATE.toString(),_2220._12697(_715.ANIMATE));
         this._12726.layout._11139(_715.GENERAL.toString(),_2220._12697(_715.GENERAL));
         this._12726.custom.autoKey = this._12724.autoKey;
         this._12726.custom.timelineFilter = this._12724.timelineFilter;
         this._12726.custom.sceneTreeFilter = this._12724.sceneTreeFilter;
         this._12726.preference.autoBind = _2216.autoBindSlot;
         this._12726.preference.delConfirm = _2216.deleteConfirm;
         this._12726.preference.smoothImg = _2216.imageSmooth;
         this._12726.preference.language = _2216.language;
         this._12726.preference.bgColor = _2216.backgroundColor;
         this._12726.preference.bgSize = _2216.backgroundSize;
         this._12726.preference.boneColor = _2216.boneColor;
         this._12726.preference.boneSize = _2216.boneSize;
         this._12726.version = this.appVersion;
      }
      
      public function get appVersion() : String
      {
         var _loc1_:XML = null;
         var _loc2_:Namespace = null;
         if(!this._appVersion)
         {
            _loc1_ = NativeApplication.nativeApplication.applicationDescriptor;
            _loc2_ = _loc1_.namespace();
            this._appVersion = _loc1_._loc2_::versionNumber[0].toString() + "." + _loc1_._loc2_::versionLabel[0];
         }
         return this._appVersion;
      }
   }
}

