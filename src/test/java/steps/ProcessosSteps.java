package steps;

import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.E;
import cucumber.api.java.pt.Quando;
import definition.Processo;
import support.RESTSupport;

public class ProcessosSteps {
    @Dado("^que o id do usuario seja \"([^\"]*)\"$")
    public void queOIdDoUsuarioSeja(String id) {
        Processo.setLastId(id);
    }

    @Quando("^o usuario clicar em ler o processo$")
    public void oUsuarioClicarEmLerOProcesso() {
        RESTSupport.executeGet(Processo.getUrl());
    }

    @Dado("^que o usuario esteja no site do processo$")
    public void queOUsuarioEstejaNoSiteDoProcesso() {
        Processo.clearFields();
    }

    @E("^que o usuario preencha o campo \"([^\"]*)\" com o valor \"([^\"]*)\"$")
    public void queOUsuarioPreenchaOCampoComOValor(String campo, String valor) {
        Processo.addFields(campo, valor);
    }

    @Quando("^o usuario clique no botao salvar processo$")
    public void oUsuarioCliqueNoBotaoSalvarProcesso() {
        RESTSupport.executePost(Processo.getUrl(), Processo.getFields());
        Processo.setLastId(RESTSupport.key("id").toString());
    }

    @Quando("^o usuario buscar o ultimo processo criado$")
    public void oUsuarioBuscarOUltimoProcessoCriado() {
        RESTSupport.executeGet(Processo.getUrl() + "/" + Processo.getLastId());
    }

    @Quando("^o usuario clique no botao salvar processo sem numero$")
    public void oUsuarioCliqueNoBotaoSalvarProcessoSemNumero() {
        RESTSupport.executePost(Processo.getUrl(), Processo.getFields());
    }

    @E("^o usuario atualizar \"([^\"]*)\" com o valor \"([^\"]*)\"$")
    public void oUsuarioAtualizarComOValor(String campo, String valor) {
        Processo.addFields(campo, valor);
    }

    @Quando("^o usuario clicar no botao atualizar processo$")
    public void oUsuarioClicarNoBotaoAtualizarProcesso() {
        String url = Processo.getUrl() + "/" + Processo.getLastId();
        RESTSupport.executePut(url, Processo.getFields());
    }

    @Quando("^o usuario clicar no botao deletar$")
    public void oUsuarioClicarNoBotaoDeletar() {
        String url = Processo.getUrl() + "/" + Processo.getLastId();
        RESTSupport.executeDelete(url);
    }
}
