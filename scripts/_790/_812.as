package _790
{
   import _1045.Group;
   import _636.ComicEvent;
   import _644._645;
   import _644._646;
   import flash.geom.Point;
   
   public class _812 extends Group
   {
      private var _6114:Vector.<_645>;
      
      private var _6132:Vector.<_792>;
      
      private var _6129:Vector.<_792>;
      
      private var _6126:_646;
      
      public var _6127:Group;
      
      public var _6128:Group;
      
      public var _5084:Group;
      
      public function _812()
      {
         super();
         this._6129 = new Vector.<_792>();
         this._6132 = new Vector.<_792>();
         this._6127 = new Group();
         this._6128 = new Group();
         this._5084 = new Group();
         addElement(this._5084);
         addElement(this._6128);
         addElement(this._6127);
      }
      
      public function set _4035(param1:Vector.<_645>) : void
      {
         this._6114 = param1;
         this.refresh();
      }
      
      public function refresh() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._3151();
         if(this._6114 == null)
         {
            return;
         }
         var _loc1_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._6114.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = 0;
            _loc4_ = int(this._6114[_loc1_].tracks.length);
            while(_loc3_ < _loc4_)
            {
               this._6131(this._6114[_loc1_].tracks[_loc3_]);
               _loc3_++;
            }
            _loc1_++;
         }
      }
      
      public function _3076(param1:_646) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this._6132.length);
         while(_loc2_ < _loc3_)
         {
            if(this._6132[_loc2_]._6044 == param1)
            {
               this._6132[_loc2_].refresh();
            }
            _loc2_++;
         }
      }
      
      private function _6131(param1:_646) : void
      {
         var _loc2_:_792 = this._6130();
         _loc2_._6044 = param1;
         this._6132.push(_loc2_);
         this._5084.addElement(_loc2_);
      }
      
      public function _5068(param1:Point = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_792 = null;
         var _loc5_:_792 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            _loc2_ = 0;
            _loc3_ = int(this._6132.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = this._6132[_loc2_];
               if(_loc4_._6048(param1))
               {
                  if(_loc5_ == null)
                  {
                     _loc5_ = _loc4_;
                     if(_loc5_.parent)
                     {
                        _loc6_ = _loc5_.parent.getChildIndex(_loc5_);
                     }
                  }
                  else if(_loc4_.parent)
                  {
                     _loc7_ = _loc4_.parent.getChildIndex(_loc4_);
                     if(_loc7_ > _loc6_)
                     {
                        _loc6_ = _loc7_;
                        _loc5_ = _loc4_;
                     }
                  }
               }
               _loc2_++;
            }
            if(_loc5_)
            {
               this._6125(_loc5_._6044);
            }
            else
            {
               this._6125(null);
            }
         }
      }
      
      private function _6130() : _792
      {
         if(this._6129.length > 0)
         {
            return this._6129.pop();
         }
         return new _792();
      }
      
      private function _3151() : void
      {
         var _loc2_:int = 0;
         var _loc3_:_792 = null;
         var _loc1_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._6132.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._6132[_loc1_];
            _loc3_.dispose();
            this._6129.push(_loc3_);
            _loc1_++;
         }
         this._6132.length = 0;
         this._5084._2426();
      }
      
      private function _6125(param1:_646) : void
      {
         if(this._6126 != param1)
         {
            dispatchEvent(new ComicEvent(ComicEvent.OUT_TRACK));
            if(param1)
            {
               dispatchEvent(new ComicEvent(ComicEvent.OVER_TRACK,param1));
            }
            this._6126 = param1;
         }
      }
      
      public function set _5057(param1:_646) : void
      {
         if(this._6126 != param1)
         {
            this._6126 = param1;
         }
      }
   }
}

