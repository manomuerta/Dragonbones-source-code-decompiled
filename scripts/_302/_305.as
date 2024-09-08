package _302
{
   import _1404._1407;
   import _18.IAction;
   import _51._70;
   import _51._79;
   import _573.TimelinePanelController;
   import _586._594;
   import _658.Mesh;
   import _658._661;
   import _93._92;
   
   public class _305 extends _92
   {
      public function _305()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override protected function _2211() : *
      {
         if(this._1838._2094 == null)
         {
            _2223.setCache = true;
         }
         _2223.index = this.mesh._2118.indexOf(this.vertex);
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_305 = param1 as _305;
         if(_loc2_)
         {
            _2223.deltaX = _loc2_.deltaX;
            _2223.deltaY = _loc2_.deltaY;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(this.vertices.length);
         while(_loc3_ < _loc4_)
         {
            this.vertices[_loc3_].x += this.deltaX;
            this.vertices[_loc3_].y += this.deltaY;
            _loc3_++;
         }
         this.mesh._3145();
         var _loc1_:Vector.<Number> = this._1838._2121;
         var _loc2_:int = int(_2223.index);
         if(this._1838._2094 == null)
         {
            this._1838._2094 = new Vector.<Number>(this.mesh._1812.length * 2);
         }
         _loc3_ = 0;
         _loc4_ = int(this._1838._2094.length);
         while(_loc3_ < _loc4_)
         {
            this._1838._2094[_loc3_] = _loc1_[_loc3_];
            _loc3_++;
         }
         _2209._3141(this._1838);
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(this.vertices.length);
         while(_loc3_ < _loc4_)
         {
            this.vertices[_loc3_].x = this._3147[_loc3_];
            this.vertices[_loc3_].y = this._3146[_loc3_];
            _loc3_++;
         }
         this.mesh._3145();
         var _loc1_:Vector.<Number> = this._1838._2121;
         var _loc2_:int = int(_2223.index);
         if(this._1838._2094 == null)
         {
            this._1838._2094 = new Vector.<Number>(this.mesh._1812.length * 2);
         }
         _loc3_ = 0;
         _loc4_ = int(this._1838._2094.length);
         while(_loc3_ < _loc4_)
         {
            this._1838._2094[_loc3_] = _loc1_[_loc3_];
            _loc3_++;
         }
         _2209._3141(this._1838);
         this._2894();
      }
      
      private function _2894() : void
      {
         this.vertex.update();
         this.mesh.invalid = true;
         this.mesh.update();
         if(this._1837)
         {
            _2212._2907(this._1837);
         }
         this._3008._3139();
         this._2852._3140();
         this._2852._3002();
      }
      
      private function get _1838() : _70
      {
         return _2223._1838 as _70;
      }
      
      private function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      private function get mesh() : Mesh
      {
         return this._1838.mesh;
      }
      
      private function get vertex() : _661
      {
         return _2223.vertex as _661;
      }
      
      private function get vertices() : Vector.<_661>
      {
         return _2223.vertices as Vector.<_661>;
      }
      
      protected function get deltaX() : Number
      {
         return _2223.deltaX as Number;
      }
      
      protected function get deltaY() : Number
      {
         return _2223.deltaY as Number;
      }
      
      protected function get _3147() : Array
      {
         return _2223._3147 as Array;
      }
      
      protected function get _3146() : Array
      {
         return _2223._3146 as Array;
      }
      
      private function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

