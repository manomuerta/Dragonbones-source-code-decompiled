package _54
{
   import _51._52;
   import _51._79;
   
   public class _56
   {
      public var tracks:Vector.<_57>;
      
      public var parent:_53;
      
      private var _1892:Number;
      
      public function _56(param1:_53)
      {
         super();
         this.tracks = new Vector.<_57>();
         this.parent = param1;
      }
      
      public function addItem(param1:_57) : void
      {
         if(this.tracks.indexOf(param1) == -1)
         {
            param1.parent = this;
            this.tracks.push(param1);
         }
      }
      
      public function addItemAt(param1:_57, param2:int) : void
      {
         if(this.tracks.indexOf(param1) == -1)
         {
            param1.parent = this;
            this.tracks.splice(param2,0,param1);
         }
      }
      
      public function removeItem(param1:_57) : void
      {
         var _loc2_:int = int(this.tracks.indexOf(param1));
         if(_loc2_ >= 0)
         {
            param1.parent = null;
            this.tracks.splice(_loc2_,1);
         }
      }
      
      public function _1829(param1:_57) : void
      {
         if(this.tracks.indexOf(param1) == -1)
         {
            this.tracks.push(param1);
         }
         param1.parent = this;
      }
      
      public function _2074(param1:_57, param2:int) : void
      {
         if(this.tracks.indexOf(param1) == -1)
         {
            this.tracks.splice(param2,0,param1);
         }
         param1.parent = this;
      }
      
      public function _2073(param1:_57) : void
      {
         var _loc2_:int = int(this.tracks.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.tracks.splice(_loc2_,1);
         }
      }
      
      public function get startPos() : int
      {
         return 0;
      }
      
      public function get duration() : Number
      {
         this._1892 = 0;
         var _loc1_:int = 0;
         var _loc2_:int = int(this.tracks.length);
         while(_loc1_ < _loc2_)
         {
            this._1892 += this.tracks[_loc1_].during;
            _loc1_++;
         }
         return this._1892;
      }
      
      public function get height() : Number
      {
         var _loc1_:_57 = this.tracks[0];
         var _loc2_:_67 = _loc1_.tweens[0];
         var _loc3_:_52 = _loc2_._1836;
         var _loc4_:_79 = _loc2_._1837;
         return _loc3_._1724.y - _loc4_._2037 * _loc3_._1724.scaleY / 2;
      }
      
      public function get _2068() : _79
      {
         var _loc1_:_57 = this.tracks[0];
         var _loc2_:_67 = _loc1_.tweens[0];
         return _loc2_._1837;
      }
      
      public function get children() : Array
      {
         var _loc2_:_57 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.tracks)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function get _1992() : _53
      {
         return this.parent;
      }
      
      public function get index() : int
      {
         return this.parent._2062.indexOf(this);
      }
   }
}

