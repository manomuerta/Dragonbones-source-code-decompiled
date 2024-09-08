package _721
{
   import _28._30;
   import _97._115;
   
   public class _753
   {
      private var _name:String;
      
      private var _5921:_30;
      
      public function _753(param1:String)
      {
         super();
         this._name = param1;
         this._5921 = _115._2365(param1);
      }
      
      public function reset() : void
      {
         this.visible = false;
         this.enabled = true;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get visible() : Boolean
      {
         return this._5921._1705;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this._5921._1705 = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this._5921.enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._5921.enabled = param1;
      }
   }
}

