package _1374
{
   import _1045.List;
   import _1045._1070;
   
   public class IconList extends List
   {
      private var _8106:Boolean;
      
      private var _8125:String = "icon";
      
      private var _8117:Function;
      
      public function IconList()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         if(!itemRenderer)
         {
            itemRenderer = IconItemRenderer;
         }
         super._2438();
      }
      
      public function get _6377() : String
      {
         return this._8125;
      }
      
      public function set _6377(param1:String) : void
      {
         if(param1 == this._8125)
         {
            return;
         }
         this._8125 = param1;
         this._8106 = true;
         _2466();
      }
      
      public function get iconFunction() : Function
      {
         return this._8117;
      }
      
      public function set iconFunction(param1:Function) : void
      {
         if(param1 == this._8117)
         {
            return;
         }
         this._8117 = param1;
         this._8106 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super._2476();
         if(this._8106)
         {
            if(_2490)
            {
               if(Boolean(layout) && layout._6056)
               {
                  for each(_loc1_ in _2490._7581())
                  {
                     this._8578(_loc1_);
                  }
               }
               else
               {
                  _loc2_ = _2490._2249;
                  _loc1_ = 0;
                  while(_loc1_ < _loc2_)
                  {
                     this._8578(_loc1_);
                     _loc1_++;
                  }
               }
            }
            this._8106 = false;
         }
      }
      
      private function _8578(param1:int) : void
      {
         var _loc2_:IconItemRenderer = _2490.getElementAt(param1) as IconItemRenderer;
         if(_loc2_)
         {
            _loc2_.icon = this._8124(_loc2_.data);
         }
      }
      
      override public function _2481(param1:_1070, param2:int, param3:Object) : _1070
      {
         if(param1 is IconItemRenderer)
         {
            IconItemRenderer(param1).icon = this._8124(param3);
         }
         return super._2481(param1,param2,param3);
      }
      
      public function _8124(param1:Object) : Object
      {
         if(this._8117 != null)
         {
            return this._8117(param1);
         }
         if(param1 is String)
         {
            return String(param1);
         }
         if(param1[this._6377])
         {
            return param1[this._6377];
         }
         return null;
      }
   }
}

