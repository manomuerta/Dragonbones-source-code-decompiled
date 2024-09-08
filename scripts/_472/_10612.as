package _472
{
   import _1009._1029;
   import _120._119;
   import _1404._1407;
   import _6.Context;
   import _639._638;
   import _668._671;
   import _721._762;
   import egret.utils.FileUtil;
   import flash.events.Event;
   
   public class _10612 extends _119
   {
      private var _10763:_671;
      
      private var _11092:_1029;
      
      private var _14609:Boolean;
      
      public function _10612(param1:_671)
      {
         this._12569 = _1407.getInstance(_12461);
         super();
         this._10763 = param1;
      }
      
      override public function run() : void
      {
         super.run();
         this._12569.callPaidFunction(1,this._save);
      }
      
      private function _save() : void
      {
         var _loc1_:_762 = null;
         var _loc2_:String = null;
         if(this._10763._2871.isNew)
         {
            _loc1_ = new _762();
            _loc1_._10671 = this._10763;
            _loc1_._5603 = true;
            _loc2_ = "";
            _loc2_ = this._2214._3277;
            _loc1_.ouputPath = _loc2_;
            _loc1_.projectName = FileUtil.getFileName(this._10763._2871.projectPath);
            this._11092 = new _1029(_loc1_);
            this._11092.open();
            this._11092.addEventListener("SaveAsConfirm",this._14608);
            this._11092.addEventListener(Event.CLOSE,this._2384);
         }
         else
         {
            this._10763._2871.save();
            complete();
         }
      }
      
      private function _14608(param1:Event) : void
      {
         this._14609 = true;
      }
      
      private function _2384(param1:Event) : void
      {
         if(this._11092)
         {
            this._11092.removeEventListener("SaveAsConfirm",this._14608);
            this._11092.removeEventListener(Event.CLOSE,this._2384);
         }
         if(this._14609)
         {
            complete();
         }
         else
         {
            fail("CANCEL");
         }
      }
      
      protected function get _2214() : _638
      {
         return Context.getInstance()._1568.appModel as _638;
      }
   }
}

