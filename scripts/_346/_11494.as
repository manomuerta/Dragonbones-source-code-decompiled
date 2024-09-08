package _346
{
   import _381._382;
   import _521._532;
   import _668._671;
   
   public class _11494 extends _364
   {
      public var direct:Boolean = false;
      
      public var _3224:Boolean = true;
      
      public function _11494()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc2_:_382 = null;
         _532.instance._2889 = [];
         var _loc1_:_671 = _2214._11562(projectPath);
         if(_loc1_)
         {
            _2214._3221(_loc1_);
            _3219._3222(_loc1_,this._3224,this.direct);
            if(!_2214._3223)
            {
               _loc2_ = new _382();
               _loc2_.execute();
            }
         }
      }
   }
}

