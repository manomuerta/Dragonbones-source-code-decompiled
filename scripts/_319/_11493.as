package _319
{
   import _18.IAction;
   import _302._12450;
   import _93._92;
   
   public class _11493 extends _92
   {
      private var _11554:_12450;
      
      private var _11556:_329;
      
      public function _11493()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1 is _11493)
         {
            _loc2_ = this._11554.merge((param1 as _11493)._11555);
            _loc2_ = this._11556.merge((param1 as _11493)._11557);
         }
         return _loc2_;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         this._11554 = new _12450();
         this._11554._1572(param1.ffdObj);
         this._11556 = new _329();
         this._11556._1572(param1.uvObj);
      }
      
      override public function execute() : void
      {
         super.execute();
         this._11554.execute();
         this._11556.execute();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._11554.revert();
         this._11556.revert();
      }
      
      public function get _11555() : _12450
      {
         return this._11554;
      }
      
      public function get _11557() : _329
      {
         return this._11556;
      }
   }
}

