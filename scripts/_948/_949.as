package _948
{
   import _127._146;
   import flash.geom.Matrix;
   
   public class _949 extends _146
   {
      protected static var _6740:Matrix = new Matrix();
      
      protected var _6741:Boolean = false;
      
      protected var _6203:String = "up";
      
      public function _949()
      {
         super();
      }
      
      override protected function _2539() : void
      {
         super._2539();
         this._3095();
      }
      
      public function _3095() : void
      {
         this._1751();
         this._1988();
      }
      
      public function _1751() : void
      {
         this.transform.matrix = this._6731();
      }
      
      public function _1988() : void
      {
      }
      
      protected function _6731() : Matrix
      {
         return null;
      }
      
      protected function _6743() : void
      {
         if(selected)
         {
            this._2080 = "down";
            if(this._6741)
            {
               this._2080 = "over";
            }
         }
         else if(this._6741)
         {
            this._2080 = "over";
         }
         else
         {
            this._2080 = "up";
         }
      }
      
      override public function set selected(param1:Boolean) : void
      {
         super.selected = param1;
         this._6743();
      }
      
      public function set _4901(param1:Boolean) : void
      {
         this._6741 = param1;
         this._6743();
      }
      
      public function get _2080() : String
      {
         return this._6203;
      }
      
      public function set _2080(param1:String) : void
      {
         this._6203 = param1;
      }
   }
}

