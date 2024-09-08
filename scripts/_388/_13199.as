package _388
{
   import _1404._1407;
   import _18.IAction;
   import _555._570;
   import _579._580;
   import _721._763;
   import _93._92;
   
   public class _13199 extends _92
   {
      public function _13199()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         if(param1 is _13199)
         {
            this._2223._1642 = (param1 as _13199)._1642._1642;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3120(this._13257);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3120(this._13258);
         this._2894();
      }
      
      private function _3120(param1:Object) : void
      {
         this.canvas.width = param1.width;
         this.canvas.height = param1.height;
         this.canvas.bgColor = param1.bgColor;
         this.canvas.hasBackground = param1.hasBackground;
         this.canvas._13227 = param1._13227;
         this.canvas.x = param1.x;
         this.canvas.y = param1.y;
         this.canvas.opened = param1.opened;
      }
      
      private function _2894() : void
      {
         this._3176._3345();
         this._2853.refresh();
      }
      
      private function get canvas() : _763
      {
         return _2223.canvas;
      }
      
      private function get _13257() : Object
      {
         return _2223._1642;
      }
      
      private function get _13258() : Object
      {
         return _2223._3430;
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

