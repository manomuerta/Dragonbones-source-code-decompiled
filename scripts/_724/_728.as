package _724
{
   import _741._745;
   import _741._746;
   
   public class _728 extends _729
   {
      public function _728(param1:_745)
      {
         var _loc2_:Vector.<_746> = null;
         if(param1)
         {
            _loc2_ = new Vector.<_746>();
            _loc2_.push(param1);
            _name = param1.name;
            _5873 = param1.path;
         }
         super(_loc2_);
         if(param1)
         {
            param1.group = _734.GROUP_FOLDER;
         }
         this._4188();
      }
      
      private function get _5895() : _745
      {
         return _5874[0] as _745;
      }
      
      private function get _5892() : Vector.<_746>
      {
         var _loc1_:_745 = _5874[0] as _745;
         if(_loc1_)
         {
            return _loc1_._5875;
         }
         return null;
      }
      
      override public function _4188() : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            _5887[_loc1_]._4188();
            _loc1_++;
         }
         if(_1563 == STATUS_MISSING)
         {
            if(Boolean(this._5895) && !this._5895.removed)
            {
               _1563 = STATUS_NEW;
               _loc3_ = _734._5894(_5887);
               _loc3_ = _734._5893(this._5892,_5887) || _loc3_;
            }
         }
         else if(this._5895.removed)
         {
            _1563 = STATUS_MISSING;
            _loc3_ = true;
         }
         else
         {
            _loc3_ = _734._5894(_5887);
            _loc3_ = _734._5893(this._5892,_5887) || _loc3_;
         }
         return _loc3_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            _5887[_loc1_].dispose();
            _loc1_++;
         }
         _5887.length = 0;
      }
   }
}

