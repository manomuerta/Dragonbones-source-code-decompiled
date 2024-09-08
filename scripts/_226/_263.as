package _226
{
   import _1404._1407;
   import _40._10598;
   import _40._10599;
   import _40._39;
   import _51._50;
   import _51._79;
   import _555._558;
   import _555._570;
   import _555._571;
   import _573.TimelinePanelController;
   import _703._705;
   import _93._92;
   
   public class _263 extends _92
   {
      public function _263()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893(this.newName);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2893(this._2952);
         this._2894();
      }
      
      override protected function _2211() : *
      {
         return this._1837.name;
      }
      
      public function _2893(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_39 = null;
         var _loc10_:_10599 = null;
         var _loc11_:_10598 = null;
         var _loc2_:_50 = this._1837.rootArmatureData;
         if(_loc2_ != null)
         {
            if(_loc2_._10658)
            {
               _loc3_ = 0;
               _loc4_ = int(_loc2_._10658.length);
               while(_loc3_ < _loc4_)
               {
                  if(_loc2_._10658[_loc3_] == this._1837.name)
                  {
                     _loc2_._10658[_loc3_] = param1;
                  }
                  _loc3_++;
               }
            }
            _loc3_ = 0;
            _loc4_ = int(_loc2_._1963.length);
            while(_loc3_ < _loc4_)
            {
               _loc9_ = _loc2_._1963[_loc3_] as _39;
               if(_loc9_)
               {
                  _loc10_ = _loc9_._10657;
                  if(_loc10_)
                  {
                     _loc5_ = 0;
                     _loc6_ = int(_loc10_._1816.length);
                     while(_loc5_ < _loc6_)
                     {
                        _loc11_ = _loc10_._1816[_loc5_];
                        _loc7_ = 0;
                        _loc8_ = int(_loc11_.zOrder.length);
                        while(_loc7_ < _loc8_)
                        {
                           if(_loc11_.zOrder[_loc7_] == this._1837.name)
                           {
                              _loc11_.zOrder[_loc7_] = param1;
                           }
                           _loc7_++;
                        }
                        _loc5_++;
                     }
                  }
               }
               _loc3_++;
            }
         }
         this._1837.name = param1;
      }
      
      public function _2894() : void
      {
         this._2880._2943(_705._2273[this._1837]);
         this._2908._2943(_705._2997[this._1837]);
         _570(_1407.getInstance(_570)).refresh();
         this._2962._2998(this._1837);
      }
      
      protected function get _1837() : _79
      {
         return _2223._1897;
      }
      
      protected function get newName() : String
      {
         return _2223.name;
      }
      
      protected function get _2952() : String
      {
         return _2208;
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _2962() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2908() : _558
      {
         return _1407.getInstance(_558) as _558;
      }
   }
}

