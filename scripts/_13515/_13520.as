package _13515
{
   import _13492._13501;
   import _13505._13510;
   import _1404._1407;
   import _18.IAction;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _13520 extends _92
   {
      private var _13723:_92;
      
      public function _13520()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_13520 = null;
         if(param1 is _13520)
         {
            _loc2_ = param1 as _13520;
            if(this._13634 === _loc2_._13634 && this.frameIndex == _loc2_.frameIndex)
            {
               _2223.newValue = (param1 as _13520).newValue;
               if(_2223._1946)
               {
                  _2223._1946.value = _2223.newValue;
               }
               return true;
            }
         }
         return false;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:Object = null;
         super._1572(param1);
         if(this._3005)
         {
            _loc2_ = {};
            _loc2_._1945 = this._13634;
            _loc2_._1946 = this._13724;
            this._13723 = new _13521();
            this._13723._1572(_loc2_);
         }
         else
         {
            _loc2_ = {};
            _loc2_._1946 = this._13724;
            _loc2_.newValue = this.newValue;
            _loc2_.oldValue = this.oldValue;
            this._13723 = new _13532();
            this._13723._1572(_loc2_);
         }
      }
      
      override public function execute() : void
      {
         if(this._13723)
         {
            this._13723.execute();
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         if(this._13723)
         {
            this._13723.revert();
         }
         this._2894();
      }
      
      protected function get frameIndex() : int
      {
         return _2223.frameIndex;
      }
      
      protected function get _13634() : _13510
      {
         return _2223._1945;
      }
      
      protected function get _13724() : _13501
      {
         return _2223._1946;
      }
      
      protected function get oldValue() : Vector.<Number>
      {
         return _2223.oldValue;
      }
      
      protected function get newValue() : Vector.<Number>
      {
         return _2223.newValue;
      }
      
      protected function get _3005() : Boolean
      {
         return _2223._3005;
      }
      
      private function _2894() : void
      {
         _2209._3151();
         this._2852._3132();
         this._2852._3133();
         this._2852.refresh();
         this._2852._3002();
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

