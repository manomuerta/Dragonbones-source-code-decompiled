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
   
   public class _303 extends _92
   {
      public function _303()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override protected function _2211() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._1838._2094 == null)
         {
            _2223.setCache = true;
         }
         _2223.indices = [];
         _loc1_ = 0;
         _loc2_ = int(this.vertices.length);
         while(_loc1_ < _loc2_)
         {
            _2223.indices.push(this.mesh._2118.indexOf(this.vertices[_loc1_]));
            _loc1_++;
         }
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_303 = param1 as _303;
         if(_loc2_)
         {
            _2223.deltaX += _loc2_.deltaX;
            _2223.deltaY += _loc2_.deltaY;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._1838._2094 == null)
         {
            this._1838._2094 = new Vector.<Number>(this.mesh._1812.length * 2);
            if(this.mesh._2111)
            {
               _loc2_ = 0;
               _loc3_ = int(this.mesh._2111.length);
               while(_loc2_ < _loc3_)
               {
                  this._1838._2094[_loc2_] = this.mesh._2111[_loc2_];
                  _loc2_++;
               }
            }
         }
         _loc2_ = 0;
         _loc3_ = int(_2223.indices.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_ = int(_2223.indices[_loc2_]);
            this._1838._2094[_loc1_ * 2] += this.deltaX;
            this._1838._2094[_loc1_ * 2 + 1] += this.deltaY;
            _loc2_++;
         }
         _2209._3141(this._1838);
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._1838._2094 == null)
         {
            this._1838._2094 = new Vector.<Number>(this.mesh._1812.length * 2);
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = int(_2223.indices.length);
            while(_loc2_ < _loc3_)
            {
               _loc1_ = int(_2223.indices[_loc2_]);
               this._1838._2094[_loc1_ * 2] -= this.deltaX;
               this._1838._2094[_loc1_ * 2 + 1] -= this.deltaY;
               _loc2_++;
            }
            _2209._3141(this._1838);
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         if(this.vertex)
         {
            this.vertex.update();
         }
         if(this.mesh)
         {
            this.mesh.invalid = true;
            this.mesh.update();
            this.mesh._3138();
         }
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

