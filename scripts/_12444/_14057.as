package _12444
{
   import _1404._1407;
   import _226._10550;
   import _226._260;
   import _226._261;
   import _416._421;
   import _416._422;
   import _470._469;
   import _51._70;
   import _51._79;
   import _573.TimelinePanelController;
   import _708._715;
   import _81._83;
   import _93._92;
   
   public class _14057 extends _92
   {
      private var _14410:Vector.<_260>;
      
      private var _14408:Vector.<_10550>;
      
      private var _14409:Vector.<_261>;
      
      private var _14406:Vector.<_422>;
      
      private var _14407:Vector.<_421>;
      
      public function _14057()
      {
         super();
         _2215 = true;
         _2219 = true;
         this._14410 = new Vector.<_260>();
         this._14408 = new Vector.<_10550>();
         this._14409 = new Vector.<_261>();
         this._14406 = new Vector.<_422>();
         this._14407 = new Vector.<_421>();
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:Object = null;
         var _loc4_:_79 = null;
         var _loc6_:_10550 = null;
         var _loc7_:_260 = null;
         var _loc8_:_261 = null;
         var _loc9_:_421 = null;
         var _loc10_:_422 = null;
         super._1572(param1);
         var _loc3_:int = int(this._13352.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = this._13352[_loc5_];
            if(_2220._2873 == _715.ARMATURE)
            {
               _loc7_ = new _260();
               _loc2_ = _469._3484(_loc4_,this._14413(_loc4_.name),this._14414(_loc4_.name));
               _loc7_._1572(_loc2_);
               this._14410.push(_loc7_);
               _loc8_ = new _261();
               _loc2_ = _469._3152(_loc4_,this._14411(_loc4_.name));
               _loc8_._1572(_loc2_);
               _loc8_._2213();
               this._14409.push(_loc8_);
            }
            else if(_2220._2873 == _715.ANIMATE)
            {
               _loc9_ = new _421();
               _loc2_ = _469._14404(this._2852,_loc4_,this._14413(_loc4_.name));
               _loc9_._1572(_loc2_);
               this._14407.push(_loc9_);
               _loc10_ = new _422();
               _loc2_ = _469._14403(this._2852,_loc4_,this._14411(_loc4_.name));
               _loc10_._1572(_loc2_);
               this._14406.push(_loc10_);
            }
            _loc6_ = new _10550();
            _loc2_ = _469._14405(_loc4_,this._10564,this._14412(_loc4_.name));
            _loc6_._1572(_loc2_);
            this._14408.push(_loc6_);
            _loc5_++;
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         super.execute();
         if(_2220._2873 == _715.ARMATURE)
         {
            _loc1_ = 0;
            while(_loc1_ < this._14410.length)
            {
               this._14410[_loc1_].execute();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this._14408.length)
            {
               this._14408[_loc1_].execute();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this._14409.length)
            {
               this._14409[_loc1_].execute();
               _loc1_++;
            }
         }
         else if(_2220._2873 == _715.ANIMATE)
         {
            _loc1_ = 0;
            while(_loc1_ < this._14406.length)
            {
               this._14406[_loc1_].execute();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this._14408.length)
            {
               this._14408[_loc1_].execute();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this._14407.length)
            {
               this._14407[_loc1_].execute();
               _loc1_++;
            }
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         super.revert();
         if(_2220._2873 == _715.ARMATURE)
         {
            _loc1_ = 0;
            while(_loc1_ < this._14410.length)
            {
               this._14410[_loc1_].revert();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this._14408.length)
            {
               this._14408[_loc1_].revert();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this._14409.length)
            {
               this._14409[_loc1_].revert();
               _loc1_++;
            }
         }
         else if(_2220._2873 == _715.ANIMATE)
         {
            _loc1_ = 0;
            while(_loc1_ < this._14406.length)
            {
               this._14406[_loc1_].revert();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this._14408.length)
            {
               this._14408[_loc1_].revert();
               _loc1_++;
            }
            _loc1_ = 0;
            while(_loc1_ < this._14407.length)
            {
               this._14407[_loc1_].revert();
               _loc1_++;
            }
         }
      }
      
      protected function get _13352() : Array
      {
         return _2223._13352;
      }
      
      protected function get _10564() : String
      {
         return _2223._10564;
      }
      
      protected function _14413(param1:String) : _83
      {
         return _2223.slotProDic[param1].newColor;
      }
      
      protected function _14414(param1:String) : _83
      {
         return _2223.slotProDic[param1]._3007;
      }
      
      protected function _14412(param1:String) : String
      {
         return _2223.slotProDic[param1]._10563;
      }
      
      protected function _14411(param1:String) : _70
      {
         return _2223.slotProDic[param1]._3013;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

