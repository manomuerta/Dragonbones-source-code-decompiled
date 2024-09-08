package _388
{
   import _1404._1407;
   import _521._532;
   import _708._717;
   import _93._92;
   import egret.utils.tr;
   
   public class _14066 extends _92
   {
      public function _14066()
      {
         super();
         _2219 = true;
         _2215 = false;
      }
      
      override public function execute() : void
      {
         this._2226._14440 = _2223;
         this._3350();
      }
      
      private function _3350() : void
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         if(_1642)
         {
            _loc1_ = "";
            if(_1642 is String)
            {
               _loc1_ = _1642 as String;
            }
            else if(_1642 is Array)
            {
               _loc2_ = _1642 as Array;
               if(_loc2_.length)
               {
                  if(_loc2_.length == 1)
                  {
                     if(_loc2_[0] is String)
                     {
                        _loc1_ = _loc2_[0];
                     }
                     else if(_loc2_[0].hasOwnProperty("name"))
                     {
                        _loc1_ = _loc2_[0].name;
                     }
                  }
                  else
                  {
                     _loc3_ = 0;
                     for each(_loc4_ in _loc2_)
                     {
                        if(_loc4_.hasOwnProperty("name"))
                        {
                           _loc3_++;
                        }
                     }
                     _loc1_ = tr("Tip.Select.Show",_loc3_);
                  }
               }
            }
         }
         if(Boolean(_loc1_) && Boolean(_loc1_.length))
         {
            _2212._3334._3351(_loc1_,_717.HIGH_LIGHT);
         }
         else
         {
            _2212._3334._3344(_717.HIGH_LIGHT);
         }
      }
      
      private function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

