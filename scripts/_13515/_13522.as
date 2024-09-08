package _13515
{
   import _416._421;
   import _416._422;
   import _93._92;
   
   public class _13522 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _13522()
      {
         super();
         _2219 = true;
         _2215 = true;
         this._3108 = new Vector.<_92>();
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:_92 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super._1572(param1);
         if(Boolean(this._13726) && this._13726.length > 0)
         {
            _loc2_ = new _13518();
            _loc2_._1572(this._13726);
            this._3108.push(_loc2_);
         }
         if(Boolean(this._13727) && this._13727.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(this._13727.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_ = new _421();
               _loc2_._1572(this._13727[_loc3_]);
               this._3108.push(_loc2_);
               _loc3_++;
            }
         }
         if(Boolean(this._13725) && this._13725.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(this._13725.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_ = new _422();
               _loc2_._1572(this._13725[_loc3_]);
               this._3108.push(_loc2_);
               _loc3_++;
            }
         }
         if(Boolean(this._14424) && this._14424.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(this._14424.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_ = new _14063();
               _loc2_._1572(this._14424[_loc3_]);
               this._3108.push(_loc2_);
               _loc3_++;
            }
         }
         if(Boolean(this._13729) && this._13729.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(this._13729.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_ = new _13520();
               _loc2_._1572(this._13729[_loc3_]);
               this._3108.push(_loc2_);
               _loc3_++;
            }
         }
         if(this._13728)
         {
            _loc2_ = new _13524();
            _loc2_._1572(this._13728);
            this._3108.push(_loc2_);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.execute();
         if(this._3108.length)
         {
            _loc2_ = int(this._3108.length);
            while(_loc1_ < _loc2_)
            {
               this._3108[_loc1_].execute();
               _loc1_++;
            }
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         super.execute();
         if(this._3108.length)
         {
            _loc1_ = int(this._3108.length - 1);
            while(_loc1_ >= 0)
            {
               this._3108[_loc1_].revert();
               _loc1_--;
            }
         }
      }
      
      private function get _13726() : Array
      {
         return _2223._13726;
      }
      
      private function get _13727() : Array
      {
         return _2223._13727;
      }
      
      private function get _13725() : Array
      {
         return _2223._13725;
      }
      
      private function get _14424() : Array
      {
         return _2223._14424;
      }
      
      private function get _13729() : Array
      {
         return _2223._13729;
      }
      
      private function get _13728() : Object
      {
         return _2223._13728;
      }
   }
}

