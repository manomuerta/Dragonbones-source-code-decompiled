package _724
{
   import _741._746;
   
   public class _729 extends _725
   {
      protected var _5887:Vector.<_725>;
      
      public function _729(param1:Vector.<_746> = null)
      {
         super(param1);
         this._5887 = new Vector.<_725>();
      }
      
      public function get _5833() : Vector.<_725>
      {
         return this._5887;
      }
      
      public function _3807(param1:String) : _725
      {
         var _loc2_:_725 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._5887.length);
         while(_loc3_ < _loc4_)
         {
            if(this._5887[_loc3_] is _729)
            {
               _loc2_ = (this._5887[_loc3_] as _729)._3807(param1);
               if(_loc2_ != null)
               {
                  return _loc2_;
               }
            }
            else if(this._5887[_loc3_].path == param1 && !this._5887[_loc3_].missing)
            {
               return this._5887[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

