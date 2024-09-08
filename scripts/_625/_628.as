package _625
{
   import _1009._1025;
   import _1177.UIEvent;
   import _1374.Alert;
   import _767._769;
   import _93._94;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.utils.ByteArray;
   
   public class _628 extends _94
   {
      private var window:_1025;
      
      public function _628()
      {
         super();
      }
      
      public function _3155() : void
      {
         this.window = new _1025();
         this.window.addEventListener(UIEvent.CREATION_COMPLETE,this._5481);
         this.window.callback = this._5523;
         this.window.open();
      }
      
      protected function _5481(param1:UIEvent) : void
      {
         var _loc2_:String = null;
         if(Boolean(_2214._1844) && Boolean(_2214._1844._2871))
         {
            _loc2_ = FileUtil.getFileName(_2214._1844.path);
            this.window._5521.label = tr("IssueReport.upload",_loc2_);
            this.window._5521.visible = true;
            this.window._5522.visible = true;
         }
         else
         {
            this.window._5521.visible = false;
            this.window._5522.visible = false;
         }
      }
      
      private function _5523(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:ByteArray = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:ByteArray = null;
         if(param1.upload)
         {
            if(Boolean(_2214._1844) && Boolean(_2214._1844._2871))
            {
               _loc3_ = _2214._1844.path;
               _loc4_ = FileUtil.getFileName(_loc3_);
               _loc5_ = FileUtil.openAsByteArray(_loc3_);
               param1.projectName = _loc4_;
               param1.projectContent = _loc5_;
            }
         }
         if(param1.attachment)
         {
            _loc6_ = param1.attachment;
            _loc7_ = FileUtil.getExtension(_loc6_);
            _loc8_ = FileUtil.openAsByteArray(_loc6_);
            param1._10788 = _loc7_;
            param1.attachmentContent = _loc8_;
         }
         var _loc2_:_769 = new _769(param1.type,param1.desc,param1.projectName,param1.projectContent,param1._10788,param1.attachmentContent,param1.name,param1.phone,param1.qq,param1.weixin,param1.email);
         _loc2_.request(this.onComplete,this.onError);
         this.window.sending = false;
      }
      
      private function onError() : void
      {
         Alert.show(tr("IssueReport.fail"));
         this.window.sending = true;
      }
      
      private function onComplete(param1:Object) : void
      {
         Alert.show(tr("IssueReport.success"));
         this.window.close();
      }
   }
}

