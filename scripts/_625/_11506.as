package _625
{
   import _1009.CrashWindow;
   import _1374.Alert;
   import _1404._1407;
   import _472._471;
   import _767._769;
   import _783._782;
   import _93._94;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class _11506 extends _94
   {
      private var _11694:CrashWindow;
      
      public function _11506()
      {
         super();
      }
      
      public function _3155() : void
      {
         var _loc1_:Boolean = false;
         if(_2214 && _2214._1844 && _2214._1844._2871 && Boolean(_2214._1844._2871.projectPath))
         {
            _loc1_ = true;
         }
         this._11694 = new CrashWindow(_loc1_);
         this._11694._11697.addEventListener(MouseEvent.CLICK,this._11576);
         this._11694._11693.addEventListener(MouseEvent.CLICK,this._11574);
         this._11694._11698.addEventListener(MouseEvent.CLICK,this._11699);
         this._11694._11438.addEventListener(MouseEvent.CLICK,this._2384);
         this._11694.open();
      }
      
      private function _11576(param1:MouseEvent) : void
      {
         this._11696();
         this._11695();
         _1567(new _782(_782.RESTART));
      }
      
      private function _11696() : void
      {
         (_1407.getInstance(_633) as _633)._11696();
      }
      
      private function _11574(param1:MouseEvent) : void
      {
         _2214._11692();
      }
      
      private function _11699(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Object = null;
         var _loc4_:_769 = null;
         if(_2214 && _2214._1844 && _2214._1844._2871 && Boolean(_2214._1844._2871.projectPath))
         {
            _loc2_ = _2214._1844._2871.projectPath;
            _loc3_ = {};
            _loc3_.type = 5;
            _loc3_.desc = "crash upload";
            _loc3_.projectName = _2214._1844.fileName;
            _loc3_.projectContent = FileUtil.openAsByteArray(_loc2_);
            _loc3_.email = this._11694._11700.text;
            _loc4_ = new _769(_loc3_.type,_loc3_.desc,_loc3_.projectName,_loc3_.projectContent,_loc3_._10788,_loc3_.attachmentContent,_loc3_.name,_loc3_.phone,_loc3_.qq,_loc3_.weixin,_loc3_.email);
            _loc4_.request(this.onComplete,this.onError);
            this._11694.sending = false;
         }
      }
      
      private function onError() : void
      {
         Alert.show(tr("IssueReport.fail"));
         this._11694.sending = true;
      }
      
      private function onComplete(param1:Object) : void
      {
         Alert.show(tr("IssueReport.success"));
         this._11694.sending = true;
      }
      
      private function _2384(param1:MouseEvent) : void
      {
         this._11696();
         this._11695();
         _1567(new _782(_782.RESTART));
      }
      
      public function _11695() : void
      {
         if(this._11694)
         {
            this._11694._11697.removeEventListener(MouseEvent.CLICK,this._11576);
            this._11694._11693.removeEventListener(MouseEvent.CLICK,this._11574);
            this._11694._11698.removeEventListener(MouseEvent.CLICK,this._11699);
            this._11694._11438.removeEventListener(MouseEvent.CLICK,this._2384);
            this._11694.close();
            this._11694 = null;
         }
      }
      
      protected function get _2210() : _471
      {
         return _1407.getInstance(_471) as _471;
      }
   }
}

