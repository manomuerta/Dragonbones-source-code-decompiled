package _54
{
   public class _57
   {
      public var tweens:Vector.<_67>;
      
      public var parent:_56;
      
      private var _2077:Number;
      
      public function _57(param1:_56)
      {
         super();
         this.tweens = new Vector.<_67>();
         this.parent = param1;
      }
      
      public function addItem(param1:_67) : void
      {
         if(this.tweens.indexOf(param1) == -1)
         {
            param1.parent = this;
            this.tweens.push(param1);
         }
      }
      
      public function addItemAt(param1:_67, param2:int) : void
      {
         if(this.tweens.indexOf(param1) == -1)
         {
            param1.parent = this;
            this.tweens.splice(param2,0,param1);
         }
      }
      
      public function removeItem(param1:_67) : void
      {
         var _loc2_:int = int(this.tweens.indexOf(param1));
         if(_loc2_ >= 0)
         {
            param1.parent = null;
            this.tweens.splice(_loc2_,1);
         }
      }
      
      public function addTween(param1:_67) : void
      {
         if(this.tweens.indexOf(param1) == -1)
         {
            this.tweens.push(param1);
         }
         param1.parent = this;
      }
      
      public function _2076(param1:_67, param2:int) : void
      {
         if(this.tweens.indexOf(param1) == -1)
         {
            this.tweens.splice(param2,0,param1);
         }
         param1.parent = this;
      }
      
      public function _2075(param1:_67) : void
      {
         var _loc2_:int = int(this.tweens.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.tweens.splice(_loc2_,1);
         }
      }
      
      public function get during() : Number
      {
         this._2077 = 0;
         var _loc1_:int = 0;
         var _loc2_:int = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this._2077 < this.tweens[_loc1_].during)
            {
               this._2077 = this.tweens[_loc1_].during;
            }
            _loc1_++;
         }
         return this._2077;
      }
      
      public function get children() : Array
      {
         var _loc2_:_67 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.tweens)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function get _1992() : _53
      {
         return this.parent.parent;
      }
      
      public function get _2070() : _56
      {
         return this.parent;
      }
      
      public function get index() : int
      {
         return this.parent.tracks.indexOf(this);
      }
   }
}

