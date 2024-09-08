package _625
{
   import _1009._1029;
   import _11106._11105;
   import _11111._11110;
   import _1404._1407;
   import _472._12461;
   import _721._762;
   import _783.TipNotification;
   import _93._94;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.filesystem.File;
   
   public class _633 extends _94
   {
      private var _11092:_1029;
      
      public function _633()
      {
         this._12569 = _1407.getInstance(_12461);
         super();
      }
      
      public function _3308() : void
      {
         if(this._11092)
         {
            return;
         }
         this._12569.callPaidFunction(1,this._save);
      }
      
      private function _2384(param1:Event) : void
      {
         this._11092.removeEventListener(Event.CLOSE,this._2384);
         this._11092 = null;
      }
      
      public function _5602(param1:_762) : void
      {
         _11110.instance._11563._11139(_11105.SaveAsProject_CopyLibrary,param1._5603 ? "1" : "0");
         _11110.instance._11563._11132();
         if(param1._10671)
         {
            param1._10671._2871.saveAs(param1,_2214);
         }
         else if(!_2214._1844._2871.saveAs(param1,_2214))
         {
            _1567(new TipNotification(TipNotification.TIP_ALERT,tr("SaveAs.fail")));
         }
      }
      
      private function _save() : void
      {
         var _loc1_:_762 = new _762();
         _loc1_._5603 = true;
         var _loc2_:String = "";
         if(_2214._1844._2871.isNew)
         {
            _loc2_ = FileUtil.escapePath(_2214._3277 + "/" + _2214._1844.fileName);
         }
         else
         {
            _loc2_ = FileUtil.getDirectory(_2214._1844._2871.projectPath);
         }
         _loc1_.ouputPath = _loc2_;
         _loc1_.projectName = FileUtil.getFileName(_2214._1844._2871.projectPath);
         this._11092 = new _1029(_loc1_);
         this._11092.open();
         this._11092.addEventListener(Event.CLOSE,this._2384);
      }
      
      public function _11696() : void
      {
         var _loc1_:_762 = null;
         var _loc2_:String = null;
         var _loc3_:* = null;
         var _loc4_:File = null;
         var _loc5_:int = 0;
         if(_2214 && _2214._1844 && _2214._1844._2871 && !_2214._1844._2871.isNew)
         {
            _loc1_ = new _762();
            _loc1_._5603 = false;
            _loc2_ = "";
            _loc2_ = FileUtil.getDirectory(_2214._1844._2871.projectPath);
            _loc3_ = FileUtil.getFileName(_2214._1844._2871.projectPath);
            _loc3_ += "_backup";
            _loc1_.projectName = _loc3_;
            _loc1_.ouputPath = _loc2_;
            _loc1_._10705 = true;
            _loc4_ = new File(_loc2_ + _loc3_ + ".dbproj");
            _loc5_ = 1;
            while(_loc4_.exists)
            {
               _loc4_ = _loc4_.resolvePath(_loc2_ + _loc3_ + "_" + _loc5_ + ".dbproj");
               _loc1_.projectName = _loc3_ + "_" + _loc5_;
               _loc5_++;
            }
            _2214._1844._2871.saveAs(_loc1_,_2214);
         }
      }
   }
}

